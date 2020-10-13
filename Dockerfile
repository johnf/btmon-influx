FROM python:2-slim AS base

FROM base AS builder

COPY requirements.txt /app/requirements.txt
WORKDIR /app

RUN pip install --user -r requirements.txt
ADD https://raw.githubusercontent.com/matthewwall/mtools/master/bin/btmon.py btmon.py
RUN chmod +x btmon.py

FROM base AS app

COPY --from=builder /root/.local /root/.local
COPY --from=builder /app/btmon.py /app/btmon.py
WORKDIR /app

# ENV PATH=/root/.local/bin:$PATH
CMD ["./btmon.py", "-c", "/etc/btmon.cfg"]
