FROM nixos/nix:2.3.4

WORKDIR /e2etests
COPY runner/ /e2etest/runner
COPY default.nix /e2etest
RUN nix-env -f /e2etest -i e2etest

COPY tests/* /e2etests/tests/
CMD ["sh", "-c", "e2etest /e2etests/tests/*"]
